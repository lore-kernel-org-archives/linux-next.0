From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: linux-next: Tree for Dec 17 (regulator/mcp16502.c)
Date: Mon, 17 Dec 2018 08:03:55 -0800
Message-ID: <c7bd09d3-3c04-327e-6c0b-89ee058cced8@infradead.org>
References: <20181217220914.29144a09@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181217220914.29144a09@canb.auug.org.au>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Andrei Stefanescu <andrei.stefanescu@microchip.com>
List-Id: linux-next.vger.kernel.org

On 12/17/18 3:09 AM, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20181214:
> 

on i386:
# CONFIG_SUSPEND is not set
CONFIG_PM=y

  CC      drivers/regulator/mcp16502.o
In file included from ../include/linux/device.h:23:0,
                 from ../include/linux/gpio/driver.h:5,
                 from ../include/asm-generic/gpio.h:13,
                 from ../include/linux/gpio.h:62,
                 from ../drivers/regulator/mcp16502.c:11:
../drivers/regulator/mcp16502.c:527:32: error: 'mcp16502_suspend_noirq' undeclared here (not in a function)
  SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(mcp16502_suspend_noirq,
                                ^
../include/linux/pm.h:342:19: note: in definition of macro 'SET_NOIRQ_SYSTEM_SLEEP_PM_OPS'
  .suspend_noirq = suspend_fn, \
                   ^
../drivers/regulator/mcp16502.c:528:10: error: 'mcp16502_resume_noirq' undeclared here (not in a function)
          mcp16502_resume_noirq)
          ^
../include/linux/pm.h:343:18: note: in definition of macro 'SET_NOIRQ_SYSTEM_SLEEP_PM_OPS'
  .resume_noirq = resume_fn, \
                  ^



-- 
~Randy
