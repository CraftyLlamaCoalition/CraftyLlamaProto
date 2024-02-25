
OUT_DIR = generated

all: go python

go: generated_dir
	@mkdir -p $(OUT_DIR) && \
	protoc --go_out=$(OUT_DIR)/. --go_opt=paths=source_relative  --go-grpc_out=$(OUT_DIR)/. --go-grpc_opt=paths=source_relative  ./GatewayService.proto

python: generated_dir
	@mkdir -p $(OUT_DIR) && \
	python3 -m grpc_tools.protoc -I./ --python_out=$(OUT_DIR)/. --pyi_out=$(OUT_DIR)/. --grpc_python_out=$(OUT_DIR)/. ./GatewayService.proto

generated_dir:
	@mkdir -p $(OUT_DIR)

clean: 
	rm -rf $(OUT_DIR)
