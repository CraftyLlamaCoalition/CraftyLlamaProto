
OUT_DIR = ./generated
SERVICE_NAME = CriaNotesService.proto
PROTO_FILES := $(wildcard *.proto)
PROTO_BASENAMES := $(subst .proto,,$(PROTO_FILES))

all: go python

go: $(addprefix $(OUT_DIR)/go/,$(PROTO_BASENAMES))
python:  $(addprefix $(OUT_DIR)/python/,$(PROTO_BASENAMES))
  

$(OUT_DIR)/go/%: %.proto
	@mkdir -p $@
	protoc --go_out=$@ --go_opt=paths=source_relative  --go-grpc_out=$@ --go-grpc_opt=paths=source_relative  $<

$(OUT_DIR)/python/%: %.proto
	@mkdir -p $@
	python3 -m grpc_tools.protoc -I./ --python_out=$@ --pyi_out=$@ --grpc_python_out=$@ $<

clean: 
	rm -rf $(OUT_DIR)
