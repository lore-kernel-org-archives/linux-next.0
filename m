From: Bart Van Assche <bvanassche@acm.org>
Subject: Re: linux-next: build warning after merge of the scsi tree
Date: Thu, 4 Apr 2019 21:30:57 -0700
Message-ID: <a1d4b608-a077-a757-9407-5cde4681e3af@acm.org>
References: <20190405142347.1f264cdf@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190405142347.1f264cdf@canb.auug.org.au>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, James Bottomley <James.Bottomley@HansenPartnership.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "Martin K. Petersen" <martin.petersen@oracle.com>
List-Id: linux-next.vger.kernel.org

On 4/4/19 8:25 PM, Stephen Rothwell wrote:
> Hi James,
> 
> After merging the scsi tree, today's linux-next build (powerpc
> ppc64_defconfig) produced this warning:
> 
> drivers/scsi/lpfc/lpfc_nvme.c:2140:1: warning: 'lpfc_nvme_lport_unreg_wait' defined but not used [-Wunused-function]
>   lpfc_nvme_lport_unreg_wait(struct lpfc_vport *vport,
>   ^~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> Introduced by commit
> 
>    3999df75bccb ("scsi: lpfc: Declare local functions static")
> 
> It use is guarded by IS_ENABLED(CONFIG_NVME_FC).

I will have a closer look at this tomorrow.

Bart.
