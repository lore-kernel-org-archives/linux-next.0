From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
Subject: Re: linux-next: manual merge of the mfd tree with Linus' tree
Date: Fri, 8 Feb 2019 10:33:01 +0200
Message-ID: <e5610b74-043e-07e0-c024-4513f964e8ae@linux.intel.com>
References: <20190208133737.7e754345@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190208133737.7e754345@canb.auug.org.au>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Lee Jones <lee.jones@linaro.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Sinan Kaya <okaya@kernel.org>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
List-Id: linux-next.vger.kernel.org

On 2/8/19 4:37 AM, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the mfd tree got a conflict in:
> 
>    drivers/mfd/Kconfig
> 
> between commit:
> 
>    9baddb61dfec ("mfd: Fix unmet dependency warning for MFD_TPS68470")
> 
> from Linus' tree and commit:
> 
>    09fdc9857712 ("mfd: Kconfig: Fix I2C_DESIGNWARE_PLATFORM dependencies")
> 
> from the mfd tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
> 
Thanks, that's is the right fix for the conflict.

-- 
Jarkko
