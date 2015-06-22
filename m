From: Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH] Documentation/vDSO: don't build tests when cross
 compiling
Date: Mon, 22 Jun 2015 15:10:28 -0600
Message-ID: <20150622151028.3e0d6108@lwn.net>
References: <1434849028-26733-1-git-send-email-paul.gortmaker@windriver.com>
	<20150622104124.62299220@lwn.net>
	<CALCETrU=OZBbQhzi-7mSM5AXor15rqynrVippv9nMbKCxHGu7A@mail.gmail.com>
	<20150622190942.GM16386@windriver.com>
	<CALCETrX1r6_CJgN=iZsnOxdOQRNgc6JH-qBN2O9-Hu-jDnxTpw@mail.gmail.com>
	<20150622204109.GN16386@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <20150622204109.GN16386@windriver.com>
Sender: linux-doc-owner@vger.kernel.org
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: Andy Lutomirski <luto@amacapital.net>, Stephen Rothwell <sfr@canb.auug.org.au>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Mon, 22 Jun 2015 16:41:10 -0400
Paul Gortmaker <paul.gortmaker@windriver.com> wrote:

> "These compilers are only functional for kernel builds. They cannot be
> used to build userspace code"

I guess that's probably the key point.  Maybe I should just apply the
patches and be done with it.

Thanks,

jon
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
