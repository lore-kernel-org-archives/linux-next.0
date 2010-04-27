From: Jonathan Corbet <corbet@lwn.net>
Subject: Re: linux-next: build failure after merge of the final tree (viafb
 tree related)
Date: Tue, 27 Apr 2010 06:43:29 -0600
Message-ID: <20100427064329.226e623d@bike.lwn.net>
References: <20100427154925.7315ed67.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20100427154925.7315ed67.sfr@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Chris Ball <cjb@laptop.org>
List-Id: linux-next.vger.kernel.org

On Tue, 27 Apr 2010 15:49:25 +1000
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> After merging the final tree, today's linux-next build (powerpc
> allyesconfig) failed like this:
> 
> drivers/video/via/hw.c:21:22: error: asm/olpc.h: No such file or directory

Interesting...I assume this was a non-x86 build?  Viafb should, I
think, always be x86-only...I can put in a fix for that.  Sorry for the
trouble.

jon
