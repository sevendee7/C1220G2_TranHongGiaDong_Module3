package model.bean;

public class Service {
    private String id;
    private String name;
    private Double area;
    private Double cost;
    private Integer capacity;
    private String standardRoom;
    private String otherDescription;
    private Double pool_area;
    private Integer floor;
    private Integer rentType;
    private Integer serviceType;

    public Service() {
    }

    public Service(String name, Double area, Double cost, Integer capacity, String standardRoom,
                   String otherDescription, Double pool_area, Integer floor, Integer rentType, Integer serviceType) {
        this.name = name;
        this.area = area;
        this.cost = cost;
        this.capacity = capacity;
        this.standardRoom = standardRoom;
        this.otherDescription = otherDescription;
        this.pool_area = pool_area;
        this.floor = floor;
        this.rentType = rentType;
        this.serviceType = serviceType;
    }

    public Service(String id, String name, Double area, Double cost, Integer capacity,
                   String standardRoom, String otherDescription, Double pool_area, Integer floor, Integer rentType, Integer serviceType) {
        this.id = id;
        this.name = name;
        this.area = area;
        this.cost = cost;
        this.capacity = capacity;
        this.standardRoom = standardRoom;
        this.otherDescription = otherDescription;
        this.pool_area = pool_area;
        this.floor = floor;
        this.rentType = rentType;
        this.serviceType = serviceType;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Double getArea() {
        return area;
    }

    public void setArea(Double area) {
        this.area = area;
    }

    public Double getCost() {
        return cost;
    }

    public void setCost(Double cost) {
        this.cost = cost;
    }

    public Integer getCapacity() {
        return capacity;
    }

    public void setCapacity(Integer capacity) {
        this.capacity = capacity;
    }

    public String getStandardRoom() {
        return standardRoom;
    }

    public void setStandardRoom(String standardRoom) {
        this.standardRoom = standardRoom;
    }

    public String getOtherDescription() {
        return otherDescription;
    }

    public void setOtherDescription(String otherDescription) {
        this.otherDescription = otherDescription;
    }

    public Double getPool_area() {
        return pool_area;
    }

    public void setPool_area(Double pool_area) {
        this.pool_area = pool_area;
    }

    public Integer getFloor() {
        return floor;
    }

    public void setFloor(Integer floor) {
        this.floor = floor;
    }

    public Integer getRentType() {
        return rentType;
    }

    public void setRentType(Integer rentType) {
        this.rentType = rentType;
    }

    public Integer getServiceType() {
        return serviceType;
    }

    public void setServiceType(Integer serviceType) {
        this.serviceType = serviceType;
    }

    @Override
    public String toString() {
        return "Service{" +
                "id='" + id + '\'' +
                ", name='" + name + '\'' +
                ", area=" + area +
                ", cost=" + cost +
                ", capacity=" + capacity +
                ", standardRoom='" + standardRoom + '\'' +
                ", otherDescription='" + otherDescription + '\'' +
                ", pool_area=" + pool_area +
                ", floor=" + floor +
                ", rentType=" + rentType +
                ", serviceType=" + serviceType +
                '}';
    }
}
