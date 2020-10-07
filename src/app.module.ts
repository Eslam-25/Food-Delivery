import { HttpModule, Module } from '@nestjs/common';
import { ConfigModule } from '@nestjs/config';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import * as Joi from '@hapi/joi';
import { TypeOrmModule, TypeOrmModuleOptions } from '@nestjs/typeorm';
import ApplicationConfigService from './core/app-config/app-config.service';
import AppConfigModule from './core/app-config/app-config.module';
import HomeModule from 'modules/home-module/home.module';

@Module({
  imports: [
    HttpModule,
    AppConfigModule,
    ConfigModule.forRoot({
      envFilePath: [`./src/env/${process.env.NODE_ENV || 'development'}.env`],
      isGlobal: true,
      validationSchema: Joi.object({
        NODE_ENV: Joi.string()
          .valid('development', 'production', 'test')
          .default('development'),
        HTTP_PORT: Joi.number().default(3000),
      }),
    }),
    TypeOrmModule.forRootAsync({
      useFactory: async (
        config: ApplicationConfigService,
      ): Promise<TypeOrmModuleOptions> => {
        return config.getTypeOrmConfig();
      },
      inject: [ApplicationConfigService],
    }),
    HomeModule,
  ],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {}
