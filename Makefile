PROTO_DIR := proto
LANG ?= go
OUT_DIR := $(OUT_DIR_BASE)/$(LANG)
PROTOC := protoc
PROTOC_FLAGS := --go_out=$(OUT_DIR) --go_opt=paths=source_relative \
                --go-grpc_out=$(OUT_DIR) --go-grpc_opt=paths=source_relative

PROTO_FILES := $(wildcard $(PROTO_DIR)/**/*.proto)

.PHONY: all
all: $(OUT_DIR)

$(OUT_DIR):
	@mkdir -p $(OUT_DIR)
	$(PROTOC) -I $(PROTO_DIR) $(PROTO_FILES) $(PROTOC_FLAGS)