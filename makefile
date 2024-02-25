
OUT_DIR = generated

all: go python

go: generated_dir
	@mkdir -p $(OUT_DIR)/go && \
	protoc --go_out=$(OUT_DIR)/go/. --go_opt=paths=source_relative  --go-grpc_out=$(OUT_DIR)/go/. --go-grpc_opt=paths=source_relative  ./GatewayService.proto

python: generated_dir
	@mkdir -p $(OUT_DIR)/python && \
	python3 -m grpc_tools.protoc -I./ --python_out=$(OUT_DIR)/python/. --pyi_out=$(OUT_DIR)/python/. --grpc_python_out=$(OUT_DIR)/python/. ./GatewayService.proto

generated_dir:
	@mkdir -p $(OUT_DIR)

clean: 
	rm -rf generated
