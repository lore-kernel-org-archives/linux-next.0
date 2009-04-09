From: Mauro Carvalho Chehab <mchehab@infradead.org>
Subject: Re: Next April 9 : x86 allmodconfig media/video/cx88 build break
Date: Thu, 9 Apr 2009 07:28:54 -0300
Message-ID: <20090409072854.3ed8a3bd@pedra.chehab.org>
References: <20090409163305.8c7a0371.sfr@canb.auug.org.au>
	<49DDC93B.8020106@in.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-media-owner@vger.kernel.org>
In-Reply-To: <49DDC93B.8020106@in.ibm.com>
Sender: linux-media-owner@vger.kernel.org
To: Sachin Sant <sachinp@in.ibm.com>
Cc: linux-media@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Thu, 09 Apr 2009 15:38:59 +0530
Sachin Sant <sachinp@in.ibm.com> wrote:

> Today's Next tree allmodconfig build on x86 failed with
> 
> ERROR: __divdi3 [drivers/media/video/cx88/cx88xx.ko] undefined!
> 
> Thanks
> -Sachin
> 
Hi Sachin,

Thanks for warning about this. This error happens only with some gcc versions.
Yet, I'm adding a patch to use do_div() to avoid such troubles. It should be
there for today's linux-next.

Cheers,
Mauro
