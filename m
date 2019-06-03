From: Tyrel Datwyler <tyreld@linux.vnet.ibm.com>
Subject: Re: linux-next: build warning after merge of the scsi tree
Date: Mon, 3 Jun 2019 16:37:27 -0700
Message-ID: <03f28c08-f38b-f04e-a541-f5e441aff690@linux.vnet.ibm.com>
References: <20190531133612.35276ad9@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190531133612.35276ad9@canb.auug.org.au>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, James Bottomley <James.Bottomley@HansenPartnership.com>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "Martin K. Petersen" <martin.petersen@oracle.com>
List-Id: linux-next.vger.kernel.org

On 05/30/2019 08:36 PM, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the scsi tree, today's linux-next build (powerpc
> ppc64_defconfig) produced this warning:
> 
> drivers/scsi/ibmvscsi/ibmvscsi.c: In function 'ibmvscsi_work':
> drivers/scsi/ibmvscsi/ibmvscsi.c:2151:5: warning: 'rc' may be used uninitialized in this function [-Wmaybe-uninitialized]
>   if (rc) {
>      ^
> drivers/scsi/ibmvscsi/ibmvscsi.c:2121:6: note: 'rc' was declared here
>   int rc;
>       ^~
> 
> Introduced by commit
> 
>   035a3c4046b5 ("scsi: ibmvscsi: redo driver work thread to use enum action states")
> 

Looks like somebody else noticed the warning and a proposed fix was already sent
out.

-Tyrel
