import { Global, Module } from '@nestjs/common';
import ApplicationConfigService from './app-config.service';

@Global()
@Module({
  providers: [ApplicationConfigService],
  exports: [ApplicationConfigService],
})
export default class AppConfigModule {}
