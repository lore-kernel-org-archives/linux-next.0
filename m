From: Tyrel Datwyler <tyreld@linux.vnet.ibm.com>
Subject: Re: linux-next: build warning after merge of the scsi tree
Date: Mon, 3 Jun 2019 13:29:01 -0700
Message-ID: <4029bacf-3b74-b54c-ad52-42a67a6c13f9@linux.vnet.ibm.com>
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

Oof, looks like I didn't compile with pedantic enough options, or just didn't
notice the warning. Declaration should be "int rc = 0;". I can send a follow on
patch.

-Tyrel
