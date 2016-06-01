From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH v2] pstore: add lzo/lz4 compression support
Date: Thu, 2 Jun 2016 09:10:40 +1000
Message-ID: <20160602091040.3892599b@canb.auug.org.au>
References: <CAGXu5jJJ+VN7g6w8G-Sgi-5a9ATnARZrbbwheKLc4chZzBFaJQ@mail.gmail.com>
	<ebfd596d5cb01997420a49ed20571bc254c14ac0.1455803858.git.geliangtang@163.com>
	<CAGXu5jKSf5Jw5sNjniQz9aSres4kG3X3Ypj_e8V5MThLz7+nJQ@mail.gmail.com>
	<20160430022637.GA8702@localhost.localdomain>
	<CAGXu5jLnH+RQbBzLsDhEKN+__UZnonYD85x8966cxHtEC2G2uw@mail.gmail.com>
	<3908561D78D1C84285E8C5FCA982C28F3A0BAF44@ORSMSX114.amr.corp.intel.com>
	<CAGXu5jKJi62_o+rPprKkaNGeEGOerVH9x2apPBZ8q4uRttKZDw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:41797 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750914AbcFAXKm (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 1 Jun 2016 19:10:42 -0400
In-Reply-To: <CAGXu5jKJi62_o+rPprKkaNGeEGOerVH9x2apPBZ8q4uRttKZDw@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Kees Cook <keescook@chromium.org>
Cc: Tony Luck <tony.luck@intel.com>, linux-next@vger.kernel.org

Hi Kees,

On Tue, 31 May 2016 12:44:04 -0700 Kees Cook <keescook@chromium.org> wrote:
>
> Can you please add my pstore tree to -next? I'm taking over from Tony Luck.
> 
> git://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git#for-next/pstore

Added from today.

Thanks for adding your subsystem tree as a participant of linux-next.  As
you may know, this is not a judgement of your code.  The purpose of
linux-next is for integration testing and to lower the impact of
conflicts between subsystems in the next merge window. 

You will need to ensure that the patches/commits in your tree/series have
been:
     * submitted under GPL v2 (or later) and include the Contributor's
        Signed-off-by,
     * posted to the relevant mailing list,
     * reviewed by you (or another maintainer of your subsystem tree),
     * successfully unit tested, and 
     * destined for the current or next Linux merge window.

Basically, this should be just what you would send to Linus (or ask him
to fetch).  It is allowed to be rebased if you deem it necessary.

-- 
Cheers,
Stephen Rothwell 
sfr@canb.auug.org.au
