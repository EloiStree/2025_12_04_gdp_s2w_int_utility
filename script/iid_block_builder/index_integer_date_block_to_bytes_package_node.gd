

class_name IndexIntegerDateBlockToBytesPackageNode 
extends Node

signal on_block_to_relay_as_bytes_package(bytes_package:PackedByteArray)

func push_iid_block_as_bytes( block: IndexIntegerDateBlockBuilder ) -> void:
	var bytes_package :PackedByteArray = UtilityIID.parse_iid_block_to_bytes_package(block)
	on_block_to_relay_as_bytes_package.emit(bytes_package)
