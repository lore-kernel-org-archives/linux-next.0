From: Tao Ma <tm@tao.ma>
Subject: Re: linux-next: manual merge of the akpm tree with Linus' tree
Date: Tue, 01 Nov 2011 18:47:32 +0800
Message-ID: <4EAFCE44.2050102@tao.ma>
References: <20111101191602.bb64237e8ab87671d3964ca9@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from oproxy4-pub.bluehost.com ([69.89.21.11]:48524 "HELO
	oproxy4-pub.bluehost.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1753244Ab1KAKri (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 1 Nov 2011 06:47:38 -0400
In-Reply-To: <20111101191602.bb64237e8ab87671d3964ca9@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Tao Ma <boyu.mt@taobao.com>

Hi Stephen,
	Thanks for the merge.
On 11/01/2011 04:16 PM, Stephen Rothwell wrote:
> Hi Andrew,
> 
> Today's linux-next merge of the akpm tree got a conflict in
> fs/direct-io.c between commit eb28be2b4c0a ("direct-io: separate fields
> only used in the submission path from struct dio") from Linus' tree and
> commit "fs/direct-io.c: salcuate fs_count correctly in get_more_blocks()"
> from the akpm tree.
Actually I have another patch which is rebased to current linus' tree.

So Andrew, would you mind replace the old one with the patch named
"[PATCH for 3.2] fs/direct-io.c: Calculate fs_count correctly in
get_more_blocks."

Thanks
Tao
