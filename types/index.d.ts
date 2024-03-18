declare interface CloseModal {
  close(success?: (msg: string) => void, error?: (error: unknown) => void): void;
}

declare interface CordovaPlugins {
  CloseModal: CloseModal;
}
