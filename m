From: Mimi Zohar <zohar@linux.vnet.ibm.com>
Subject: Re: linux-next: Tree for Aug 17 (EVM)
Date: Wed, 17 Aug 2011 13:00:45 -0400
Message-ID: <1313600445.4732.11.camel@localhost.localdomain>
References: <20110817151628.93911903cac8f207e9f01457@canb.auug.org.au>
	 <20110817094039.0bba7092.rdunlap@xenotime.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-security-module-owner@vger.kernel.org>
In-Reply-To: <20110817094039.0bba7092.rdunlap@xenotime.net>
Sender: linux-security-module-owner@vger.kernel.org
To: Randy Dunlap <rdunlap@xenotime.net>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Mimi Zohar <zohar@us.ibm.com>, Kylene Hall <kjhall@us.ibm.com>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, James Morris <jmorris@namei.org>, linux-security-module@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Wed, 2011-08-17 at 09:40 -0700, Randy Dunlap wrote:
> On Wed, 17 Aug 2011 15:16:28 +1000 Stephen Rothwell wrote:
> 
> > Hi all,
> > 
> > The powerpc allyesconfig build still fails today.
> 
> warning: (EVM) selects TRUSTED_KEYS which has unmet direct dependencies (KEYS && TCG_TPM)
> 
> EVM should depend on TCG_TPM [or select it :( ].

Thanks Randy for bringing this to my attention.  It's preferable to use
a trusted key to encrypt/decrypt the EVM key, but for those systems
without a TPM, user type keys are supported.  I'll add the dependency
for now, but will look into a better solution.

> Can we get an EVM entry added to MAINTAINERS, please?
> 
> ---
> ~Randy

Will do.

thanks,

Mimi


