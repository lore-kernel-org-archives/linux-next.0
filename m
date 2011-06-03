From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: Repository not clone-able via git-protocol VS.
 http(s) is fine
Date: Fri, 3 Jun 2011 19:46:02 +1000
Message-ID: <20110603194602.0d5912d8.sfr@canb.auug.org.au>
References: <BANLkTikTDfGYyL3vTK_HmEp_8vCm-dbwcA@mail.gmail.com>
	<BANLkTimK+ip-pLkL9zR-VtbdNQ6cc7Yt4A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:40627 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753778Ab1FCJqH (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Fri, 3 Jun 2011 05:46:07 -0400
In-Reply-To: <BANLkTimK+ip-pLkL9zR-VtbdNQ6cc7Yt4A@mail.gmail.com>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: sedat.dilek@gmail.com
Cc: Sedat Dilek <sedat.dilek@googlemail.com>, linux-next <linux-next@vger.kernel.org>, ftpadmin@kernel.org, ftpmaster@debian.org

Hi,

On Fri, 3 Jun 2011 11:29:34 +0200 Sedat Dilek <sedat.dilek@googlemail.com> wrote:
>
> FYI:
> The personal GIT repo of Stephen is git-clone-able:
> 
> $ git clone git://git.kernel.org/pub/scm/linux/kernel/git/sfr/linux-next.git
> Cloning into linux-next...
> remote: Counting objects: 2633561

That repository is just a symlink to the linux-next repository.  Your
problem is probably that there is a problem with the mirrors.

-- 
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/
