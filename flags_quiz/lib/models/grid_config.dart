/// Properties of grid
class GridConfig {
  final int axisCount;
  final double itemHeight;
  final double itemWidth;

  GridConfig(this.axisCount, this.itemHeight, this.itemWidth);

  double get aspectRatio => itemWidth / itemHeight;
}