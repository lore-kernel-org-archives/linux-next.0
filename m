From: Jonathan Corbet <corbet@lwn.net>
Subject: Re: linux-next: build failure after merge of the viafb tree
Date: Tue, 25 May 2010 06:56:47 -0600
Message-ID: <20100525065647.76931339@bike.lwn.net>
References: <20100525125718.703fdc08.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from tex.lwn.net ([70.33.254.29]:43104 "EHLO vena.lwn.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753903Ab0EYM4t (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Tue, 25 May 2010 08:56:49 -0400
In-Reply-To: <20100525125718.703fdc08.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Mark Gross <mgross@linux.intel.com>

On Tue, 25 May 2010 12:57:18 +1000
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> drivers/media/video/via-camera.c: In function 'viacam_streamon':
> drivers/media/video/via-camera.c:1032: error: implicit declaration of function 'pm_qos_add_requirement'

Argh.  I should have known that would happen, sorry.  Will fix shortly.

Thanks,

jon
