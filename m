From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the target-updates tree with the
 scsi tree
Date: Mon, 3 Jul 2017 16:12:07 +1000
Message-ID: <20170703161207.55311251@canb.auug.org.au>
References: <20170703155658.7e84a059@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:44667 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750793AbdGCGMK (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 3 Jul 2017 02:12:10 -0400
In-Reply-To: <20170703155658.7e84a059@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: "Nicholas A. Bellinger" <nab@linux-iscsi.org>, James Bottomley <James.Bottomley@HansenPartnership.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Quinn Tran <quinn.tran@cavium.com>, "Martin K. Petersen" <martin.petersen@oracle.com>

Hi all,

On Mon, 3 Jul 2017 15:56:58 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> @@@ -1919,14 -1869,16 +1897,18 @@@
>   	}
>   	memset(mcmd, 0, sizeof(*mcmd));
>   
>  +	cmd = container_of(se_cmd, struct qla_tgt_cmd, se_cmd);

That line should not be there.

-- 
Cheers,
Stephen Rothwell
