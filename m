From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build warnings after merge of the scsi tree
Date: Mon, 11 Dec 2017 15:26:37 +1100
Message-ID: <20171211152637.2d566a8d@canb.auug.org.au>
References: <20171206133149.30baf3eb@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:48659 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752070AbdLKE0j (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Sun, 10 Dec 2017 23:26:39 -0500
In-Reply-To: <20171206133149.30baf3eb@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Johannes Thumshirn <jthumshirn@suse.de>, "Martin K. Petersen" <martin.petersen@oracle.com>, Hannes Reinecke <hare@suse.com>

Hi all,

On Wed, 6 Dec 2017 13:31:49 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> After merging the scsi tree, today's linux-next build (x86_64
> allmodconfig) produced these warnings:
> 
> drivers/scsi/bfa/bfad_bsg.c: In function 'bfad_im_bsg_vendor_request':
> drivers/scsi/bfa/bfad_bsg.c:3137:35: warning: initialization makes pointer from integer without a cast [-Wint-conversion]
>   struct bfad_im_port_s *im_port = shost->hostdata[0];
>                                    ^
> drivers/scsi/bfa/bfad_bsg.c: In function 'bfad_im_bsg_els_ct_request':
> drivers/scsi/bfa/bfad_bsg.c:3353:35: warning: initialization makes pointer from integer without a cast [-Wint-conversion]
>   struct bfad_im_port_s *im_port = shost->hostdata[0];
>                                    ^
> 
> Introduced by commit
> 
>   45349821ab3a ("scsi: bfa: fix access to bfad_im_port_s")

I am still getting these ...

-- 
Cheers,
Stephen Rothwell
