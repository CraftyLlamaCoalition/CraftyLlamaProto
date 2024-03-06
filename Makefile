
OUT_DIR = generated
SERVICE_NAME = CriaNotesService.proto
all: go python

go: generated_dir
	@mkdir -p $(OUT_DIR)/go && \
	protoc --go_out=$(OUT_DIR)/go/. --go_opt=paths=source_relative  --go-grpc_out=$(OUT_DIR)/go/. --go-grpc_opt=paths=source_relative  ./$(SERVICE_NAME)

python: generated_dir
	@mkdir -p $(OUT_DIR)/python && \
	python3 -m grpc_tools.protoc -I./ --python_out=$(OUT_DIR)/python/. --pyi_out=$(OUT_DIR)/python/. --grpc_python_out=$(OUT_DIR)/python/. ./$(SERVICE_NAME)

generated_dir:
	@mkdir -p $(OUT_DIR)

clean: 
	rm -rf $(OUT_DIR)
