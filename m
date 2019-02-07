From: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Subject: Re: linux-next: build warning after merge of the tpmdd tree
Date: Thu, 7 Feb 2019 23:16:40 +0200
Message-ID: <20190207211640.GA23906@linux.intel.com>
References: <20190207134733.05a8e55a@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190207134733.05a8e55a@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Roberto Sassu <roberto.sassu@huawei.com>
List-Id: linux-next.vger.kernel.org

On Thu, Feb 07, 2019 at 01:47:33PM +1100, Stephen Rothwell wrote:
> Hi Jarkko,
> 
> After merging the tpmdd tree, today's linux-next build (x86_64
> allmodconfig) produced this warning:
> 
> drivers/char/tpm/tpm_i2c_nuvoton.c:45: warning: "TPM_RETRY" redefined
>  #define TPM_RETRY      5
>  
> In file included from drivers/char/tpm/tpm_i2c_nuvoton.c:35:
> drivers/char/tpm/tpm.h:43: note: this is the location of the previous definition
>  #define TPM_RETRY  50
>  
> drivers/char/tpm/tpm_i2c_infineon.c:30: warning: "TPM_BUFSIZE" redefined
>  #define TPM_BUFSIZE 1260
>  
> In file included from drivers/char/tpm/tpm_i2c_infineon.c:27:
> drivers/char/tpm/tpm.h:41: note: this is the location of the previous definition
>  #define TPM_BUFSIZE  4096
>  
> In file included from drivers/char/tpm/st33zp24/i2c.c:30:
> drivers/char/tpm/st33zp24/st33zp24.h:22: warning: "TPM_BUFSIZE" redefined
>  #define TPM_BUFSIZE                     2048
>  
> In file included from drivers/char/tpm/st33zp24/i2c.c:29:
> drivers/char/tpm/st33zp24/../tpm.h:41: note: this is the location of the previous definition
>  #define TPM_BUFSIZE  4096
>  
> In file included from drivers/char/tpm/st33zp24/spi.c:30:
> drivers/char/tpm/st33zp24/st33zp24.h:22: warning: "TPM_BUFSIZE" redefined
>  #define TPM_BUFSIZE                     2048
>  
> In file included from drivers/char/tpm/st33zp24/spi.c:29:
> drivers/char/tpm/st33zp24/../tpm.h:41: note: this is the location of the previous definition
>  #define TPM_BUFSIZE  4096
>  
> In file included from drivers/char/tpm/st33zp24/st33zp24.c:34:
> drivers/char/tpm/st33zp24/st33zp24.h:22: warning: "TPM_BUFSIZE" redefined
>  #define TPM_BUFSIZE                     2048
>  
> In file included from drivers/char/tpm/st33zp24/st33zp24.c:33:
> drivers/char/tpm/st33zp24/../tpm.h:41: note: this is the location of the previous definition
>  #define TPM_BUFSIZE  4096
>  
> In file included from drivers/char/tpm/st33zp24/st33zp24.c:34:
> drivers/char/tpm/st33zp24/st33zp24.h:22: warning: "TPM_BUFSIZE" redefined
>  #define TPM_BUFSIZE                     2048
>  
> In file included from drivers/char/tpm/st33zp24/st33zp24.c:33:
> drivers/char/tpm/st33zp24/../tpm.h:41: note: this is the location of the previous definition
>  #define TPM_BUFSIZE  4096
>  
> 
> Introduced by commit
> 
>   569c1057f9ac ("tpm: move tpm_chip definition to include/linux/tpm.h")

Hi I forgot apply this before that commit:

tpm: Fix some name collisions with drivers/char/tpm.h

* Rename TPM_BUFSIZE defined in drivers/char/tpm/st33zp24/st33zp24.h to
  ST33ZP24_BUFSIZE.
* Rename TPM_BUFSIZE defined in drivers/char/tpm/tpm_i2c_infineon.c to
  TPM_I2C_INFINEON_BUFSIZE.
* Rename TPM_RETRY in tpm_i2c_nuvoton to TPM_I2C_RETRIES.
* Remove TPM_HEADER_SIZE from tpm_i2c_nuvoton.

Cc: stable@vger.kernel.org
Fixes: bf38b8710892 ("tpm/tpm_i2c_stm_st33: Split tpm_i2c_tpm_st33 in 2 layers (core + phy)")
Fixes: aad628c1d91a ("char/tpm: Add new driver for Infineon I2C TIS TPM")
Fixes: 32d33b29ba07 ("TPM: Retry SaveState command in suspend path")
Signed-off-by: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>

It is now pushed.

/Jarkko
