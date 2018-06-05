From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: linux-next: Tree for Jun 5 (drivers/staging/typec/tcpci_rt1711h)
Date: Tue, 5 Jun 2018 08:46:07 -0700
Message-ID: <42ea49aa-1301-da62-9d9e-b2634ffa23eb@infradead.org>
References: <20180605214728.366c0a85@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180605214728.366c0a85@canb.auug.org.au>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Linux-Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, USB list <linux-usb@vger.kernel.org>, ShuFan Lee <shufan_lee@richtek.com>
List-Id: linux-next.vger.kernel.org

On 06/05/2018 04:47 AM, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20180604:
> 

on x86_64 (randconfig):

WARNING: unmet direct dependencies detected for TYPEC_TCPCI
  Depends on [n]: STAGING [=y] && TYPEC_TCPM [=y] && I2C [=n]
  Selected by [y]:
  - TYPEC_RT1711H [=y] && STAGING [=y] && TYPEC_TCPM [=y]

../drivers/staging/typec/tcpci.c:593:1: warning: data definition has no type or storage class [enabled by default]
 module_i2c_driver(tcpci_i2c_driver);
 ^
../drivers/staging/typec/tcpci.c:593:1: error: type defaults to 'int' in declaration of 'module_i2c_driver' [-Werror=implicit-int]
../drivers/staging/typec/tcpci.c:593:1: warning: parameter names (without types) in function declaration [enabled by default]
../drivers/staging/typec/tcpci.c:584:26: warning: 'tcpci_i2c_driver' defined but not used [-Wunused-variable]
 static struct i2c_driver tcpci_i2c_driver = {
                          ^
cc1: some warnings being treated as errors
../drivers/staging/typec/tcpci_rt1711h.c: In function 'rt1711h_check_revision':
../drivers/staging/typec/tcpci_rt1711h.c:218:2: error: implicit declaration of function 'i2c_smbus_read_word_data' [-Werror=implicit-function-declaration]
  ret = i2c_smbus_read_word_data(i2c, TCPC_VENDOR_ID);
  ^
../drivers/staging/typec/tcpci_rt1711h.c: At top level:
../drivers/staging/typec/tcpci_rt1711h.c:308:1: warning: data definition has no type or storage class [enabled by default]
 module_i2c_driver(rt1711h_i2c_driver);
 ^
../drivers/staging/typec/tcpci_rt1711h.c:308:1: error: type defaults to 'int' in declaration of 'module_i2c_driver' [-Werror=implicit-int]
../drivers/staging/typec/tcpci_rt1711h.c:308:1: warning: parameter names (without types) in function declaration [enabled by default]
../drivers/staging/typec/tcpci_rt1711h.c:299:26: warning: 'rt1711h_i2c_driver' defined but not used [-Wunused-variable]
 static struct i2c_driver rt1711h_i2c_driver = {
                          ^
  CC      drivers/staging/speakup/speakup_keypc.o
cc1: some warnings being treated as errors


# CONFIG_I2C is not set

-- 
~Randy
