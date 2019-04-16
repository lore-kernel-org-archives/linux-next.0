From: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Subject: Re: linux-next: build failure after merge of the tpmdd tree
Date: Tue, 16 Apr 2019 18:36:27 +0300
Message-ID: <20190416153608.GA11353@linux.intel.com>
References: <20190416130740.7ff9e561@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190416130740.7ff9e561@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Matthew Garrett <mjg59@google.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Tue, Apr 16, 2019 at 01:07:40PM +1000, Stephen Rothwell wrote:
> Hi Jarkko,
> 
> After merging the tpmdd tree, today's linux-next build (arm
> multi_v7_defconfig) failed like this:

Matthew, looking at the code I guess the includes are in wrong order
i.e. early_ioremap.h should be included before tpm_eventlog.h. Do you
agree that this is the correct conclusion? I can do the update.

Just as a temporary measure I removed the commits from my next branch.

/Jarkko
