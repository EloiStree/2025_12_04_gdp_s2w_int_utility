# Sometimes you want to send IID as a UDP block to keep them linked
# to the relative time they should be executed.
# To do that, you append IID values and then send the block in one batch.

class_name IndexIntegerDateBlockBuilder

var iid_block: Array[IndexIntegerDate] = []

func append_value(value: int):
	var item := IndexIntegerDate.new()
	item.integer_value = value
	iid_block.append(item)


func append_index_value(index: int, value: int):
	var item := IndexIntegerDate.new()
	item.integer_index = index
	item.integer_value = value
	iid_block.append(item)


func append_value_with_date(value: int, date: int):
	var item := IndexIntegerDate.new()
	item.integer_value = value
	item.ulong_date = date
	iid_block.append(item)


func append_index_value_with_date(index: int, value: int, date: int):
	var item := IndexIntegerDate.new()
	item.integer_index = index
	item.integer_value = value
	item.ulong_date = date
	iid_block.append(item)


func append_value_with_macro_delay(value: int, delay_ms: int):
	var item := IndexIntegerDate.new()
	item.integer_value = value
	item.ulong_date = delay_ms
	iid_block.append(item)


func append_index_value_with_macro_delay(index: int, value: int, delay_ms: int):
	var item := IndexIntegerDate.new()
	item.integer_index = index
	item.integer_value = value
	item.ulong_date = delay_ms
	iid_block.append(item)


func append_value_with_delay_seconds(value: int, delay_seconds: float):
	var item := IndexIntegerDate.new()
	item.integer_value = value
	item.ulong_date = int(delay_seconds * 1000.0)
	iid_block.append(item)


func append_index_value_with_delay_seconds(index: int, value: int, delay_seconds: float):
	var item := IndexIntegerDate.new()
	item.integer_index = index
	item.integer_value = value
	item.ulong_date = int(delay_seconds * 1000.0)
	iid_block.append(item)


func clear_block():
	iid_block.clear()
