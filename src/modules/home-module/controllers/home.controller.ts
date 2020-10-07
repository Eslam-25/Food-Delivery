import { Controller, Get, Param } from '@nestjs/common';
import HomeService from '../services/home.service';

@Controller('api/home')
export class HomeController {
  constructor(private readonly homeService: HomeService) {}

  @Get()
  async getFoods() {
    return await this.homeService.getFoods();
  }

  @Get(':id')
  async getFood(@Param('id') id: number) {
    return await this.homeService.getFood(id);
  }
}
