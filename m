From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: linux-next: Tree for Jan 7 (regulator/max8973)
Date: Thu, 7 Jan 2016 10:38:03 -0800
Message-ID: <568EB08B.7010707@infradead.org>
References: <20160107212131.69b44a5d@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160107212131.69b44a5d@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
List-Id: linux-next.vger.kernel.org

On 01/07/16 02:21, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20160106:
> 

on i386:
when CONFIG_THERMAL=m
and CONFIG_REGULATOR_MAX8973=y:

drivers/built-in.o: In function `max8973_remove':
max8973-regulator.c:(.text+0x170bbb): undefined reference to `thermal_zone_of_sensor_unregister'
drivers/built-in.o: In function `max8973_thermal_irq':
max8973-regulator.c:(.text+0x1713ec): undefined reference to `thermal_zone_device_update'
drivers/built-in.o: In function `max8973_probe':
max8973-regulator.c:(.text+0x172227): undefined reference to `thermal_zone_of_sensor_register'
max8973-regulator.c:(.text+0x17238f): undefined reference to `thermal_zone_of_sensor_unregister'




-- 
~Randy
