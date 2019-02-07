From: James Smart <jsmart2021@gmail.com>
Subject: Re: linux-next: manual merge of the scsi-mkp tree with Linus' tree
Date: Thu, 7 Feb 2019 10:30:02 -0800
Message-ID: <eea2211e-6342-1949-5a3e-2c08b87db0d9@gmail.com>
References: <20190207154446.3f48c496@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190207154446.3f48c496@canb.auug.org.au>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "Ewan D. Milne" <emilne@redhat.com>
List-Id: linux-next.vger.kernel.org

On 2/6/2019 8:44 PM, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the scsi-mkp tree got a conflict in:
> 
>    drivers/scsi/lpfc/lpfc_nvme.c
> 
> between commit:
> 
>    7961cba6f7d8 ("scsi: lpfc: nvme: avoid hang / use-after-free when destroying localport")
> 
> from Linus' tree and commit:
> 
>    4c47efc140fa ("scsi: lpfc: Move SCSI and NVME Stats to hardware queue structures")
> 
> from the scsi-mkp tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
> 


Thank You. The fixup patch looks correct.

Martin, let me know if there's anything else you'd like me to do.

-- james

Signed-off-by:  James Smart <james.smart@broadcom.com>
