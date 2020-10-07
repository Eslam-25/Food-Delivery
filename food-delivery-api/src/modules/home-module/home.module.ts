import { Module } from '@nestjs/common';
import { FoodRepository } from 'infrastructure/database/repositories/food.repository';
import { HomeController } from './controllers/home.controller';
import HomeService from './services/home.service';

@Module({
  controllers: [HomeController],
  providers: [HomeService, FoodRepository],
})
export default class HomeModule {}
