From: Hans Verkuil <hverkuil@xs4all.nl>
Subject: Re: linux-next: manual merge of the rr tree with the v4l-dvb tree
Date: Tue, 17 Feb 2009 08:12:41 +0100
Message-ID: <200902170812.41326.hverkuil@xs4all.nl>
References: <20090217161138.1c50812b.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from smtp-vbr15.xs4all.nl ([194.109.24.35]:3980 "EHLO
	smtp-vbr15.xs4all.nl" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751252AbZBQHNL (ORCPT
	<rfc822;linux-next@vger.kernel.org>); Tue, 17 Feb 2009 02:13:11 -0500
In-Reply-To: <20090217161138.1c50812b.sfr@canb.auug.org.au>
Content-Disposition: inline
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Rusty Russell <rusty@rustcorp.com.au>, linux-next@vger.kernel.org, Mauro Carvalho Chehab <mchehab@redhat.com>, Arjan van de Ven <arjan@linux.intel.com>

On Tuesday 17 February 2009 06:11:38 Stephen Rothwell wrote:
> Hi Rusty,
>
> Today's linux-next merge of the rr tree got conflicts in
> drivers/media/video/saa7134/saa7134-core.c and
> drivers/media/video/saa7134/saa7134.h between commits
> 33a68ac0156dde8a60d8f23926d89b85be0a4e09 ("V4L/DVB (10247): saa7134:
> convert to the new v4l2 framework"),
> 9777b5ef44a88c8f16b885d9ea6a7240e170465e ("V4L/DVB (10404): saa7134-core:
> remove oss option, since saa7134-oss doesn't exist anymore") and
> d8f5b7fe03a2ee412b9aa7a7dc1b38c1c8d54d84 ("V4L/DVB (10405): saa7134-core:
> loading saa7134-alsa is now the default") from the v4l-dvb tree and
> commit 1b779d7819c3a19c4fdcb23144e7c2d04e4693fe ("use the new
> request_module_nowait() in drivers/media") from the rr tree.
>
> Overlapping changes.  I fixed it up (see below, please check) and can
> carry the fix as necessary.

Acked-by: Hans Verkuil <hverkuil@xs4all.nl>

-- 
Hans Verkuil - video4linux developer - sponsored by TANDBERG
