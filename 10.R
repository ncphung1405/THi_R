# Bieu do 10: BIEU THE HIEN SU PHAN BO CUA SO CA TU VONG TAI VIET NAM

library('ggplot2')
library(tibble)
library(tidyr)
library(dplyr)
library(readr)
library(ggplot2)
df_ghi_nhan <- read.csv('https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_confirmed_global.csv',
                        header = TRUE)
df_tu_vong <- read.csv('https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_deaths_global.csv',
                       header = TRUE)
df_phuc_hoi <- read.csv('https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_recovered_global.csv',
                        header = TRUE)

# xu ly du lieu so ca ghi nhan
viet_nam_ghi_nhan = df_ghi_nhan[275,5:ncol(df_ghi_nhan)]
head(viet_nam_ghi_nhan)
str(viet_nam_ghi_nhan)

so_ngay = ncol(viet_nam_ghi_nhan)
so_ca_mac <- c(2:ncol(viet_nam_ghi_nhan))

for (i in so_ca_mac){
  so_ca_mac[i] <- viet_nam_ghi_nhan[[i]]- viet_nam_ghi_nhan[[i-1]]
}

so_ca_mac
so_ca_mac_10 = so_ca_mac[(so_ngay-29):so_ngay]
so_ca_mac_10
ngay = names(viet_nam_ghi_nhan)
ngay_10 = ngay[(so_ngay-29):so_ngay]
ngay_10

data_plot_10 = data.frame(ngay=ngay_10, so_ca_mac= so_ca_mac_10)
data_plot_10

# Xu ly du lieu so ca tu vong
viet_nam_tu_vong = df_tu_vong[275,5:ncol(df_tu_vong)]
viet_nam_tu_vong

so_ca_tu_vong <- c(2:ncol(viet_nam_tu_vong))

for (i in so_ca_tu_vong){
  so_ca_tu_vong[i] <- viet_nam_tu_vong[[i]]- viet_nam_tu_vong[[i-1]]
}

so_ca_tu_vong_10 = so_ca_tu_vong[(so_ngay-29):so_ngay]
so_ca_tu_vong_10

data_plot_10_tu_vong = data.frame(ngay=ngay_10, so_ca_tu_vong= so_ca_tu_vong_10)
data_plot_10_tu_vong

# Xy ly du lieu so ca phuc hoi
viet_nam_phuc_hoi = df_phuc_hoi[260,5:ncol(df_phuc_hoi)]
viet_nam_phuc_hoi

so_ca_phuc_hoi <- c(2:ncol(viet_nam_phuc_hoi))

for (i in so_ca_phuc_hoi){
  so_ca_phuc_hoi[i] <- viet_nam_phuc_hoi[[i]]- viet_nam_phuc_hoi[[i-1]]
}

so_ca_phuc_hoi_10 = so_ca_phuc_hoi[(so_ngay-29):so_ngay]
so_ca_phuc_hoi_10

data_plot_10 = data.frame(ngay=ngay_10, so_ca_mac = so_ca_mac_10,
                          so_ca_tu_vong = so_ca_tu_vong_10,
                          so_ca_phuc_hoi = so_ca_phuc_hoi_10)
data_plot_10
data_plot <- data.frame(ngay=ngay, so_ca_mac = so_ca_mac,
                        so_ca_tu_vong = so_ca_tu_vong,
                        so_ca_phuc_hoi = so_ca_phuc_hoi)

data_plot


hp_2 <- ggplot(data_plot, aes(x=so_ca_tu_vong)) + geom_histogram(binwidth=2)
hp_2+
  labs(title="BIEU THE HIEN SU PHAN BO CUA SO CA TU VONG TAI VIET NAM")
  labs(title="BIEU THE HIEN SU TUONG QUAN SO CA TU VONG, SO CA PHUC HOI")