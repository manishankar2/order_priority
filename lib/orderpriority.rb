require "orderpriority/version"


module Orderpriority
	ActiveRecord::QueryMethods.class_eval do
		def priority_order(*args)
			check_if_method_has_arguments!(:priority_order, args)
			if is_priority_order_args(args)
				ret = "CASE"
				index = 1
				args.each do |arg|
					arg.each do |k,v|
						k = k.to_s
						unless klass.column_names.include?(k)
							raise ArgumentError, "#{k} is not a valid column for #{table.name}"
						end
						k="#{table.name}.#{table[k].name}"
						ret << " WHEN #{k} = '#{v}' then #{index}"
						ret << " WHEN #{k} like '#{v}%' then #{index += 1}"
						ret << " WHEN #{k} like '%#{v}' then #{index += 2}"
						ret << " WHEN #{k} like '%#{v}%' then #{index += 3}"
						index+=1
					end
				end
				ret << " ELSE #{index} END"
				args = [ret]
			end	
			spawn.order!(*args)
		end

		def is_priority_order_args(args)
			is_priority_order = true;
	    args.each do |arg|
	      next unless arg.is_a?(Hash)
	      arg.each do |_key, value|
					unless self.class.const_get(:VALID_DIRECTIONS).include?(value)
						is_priority_order&&= true;
					else
						is_priority_order = false;
					end
	      end
	    end
	    return is_priority_order
	  end
	end
end
