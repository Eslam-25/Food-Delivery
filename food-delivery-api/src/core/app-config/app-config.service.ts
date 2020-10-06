import { Injectable } from '@nestjs/common';
import { ConfigService } from '@nestjs/config';
import { TypeOrmModuleOptions } from '@nestjs/typeorm';

@Injectable()
class ApplicationConfigService {
  constructor(private readonly configService: ConfigService) {}

  public getTypeOrmConfig(): TypeOrmModuleOptions {
    return {
      type: 'postgres',
      host: this.configService.get('TYPEORM_HOST'),
      port: this.configService.get('TYPEORM_PORT'),
      username: this.configService.get('TYPEORM_USERNAME'),
      password: this.configService.get('TYPEORM_PASSWORD'),
      database: this.configService.get('TYPEORM_DATABASE'),
      synchronize: this.configService.get('TYPEORM_SYNCHRONIZE'),
      entities: [this.configService.get('TYPEORM_ENTITIES')],
      migrations: [this.configService.get('TYPEORM_MIGRATIONS')],
      migrationsTableName: 'migration',

      cli: {
        migrationsDir: this.configService.get('TYPEORM_MIGRATIONS_DIR'),
        entitiesDir: this.configService.get('TYPEORM_ENTITIES_DIR'),
      },
    };
  }
}

export default ApplicationConfigService;
