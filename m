From: Jan Kara <jack@suse.cz>
Subject: Re: linux-next: ext3 tree build failure
Date: Thu, 3 Dec 2009 00:37:59 +0100
Message-ID: <20091202233758.GD5808@quack.suse.cz>
References: <20091203102249.470d9bc3.sfr@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-next-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:34010 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755526AbZLBXiE (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Wed, 2 Dec 2009 18:38:04 -0500
Content-Disposition: inline
In-Reply-To: <20091203102249.470d9bc3.sfr@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

  Hi Stephen,

On Thu 03-12-09 10:22:49, Stephen Rothwell wrote:
> Today's linux-next build (powerpc ppc64_defconfig) failed like this:
> 
> fs/ext3/super.c: In function 'parse_options':
> fs/ext3/super.c:1200: error: expected expression before 'case'
> 
> Caused by commit 1bef03b44fd8977ee7f6b556e47a8e97b97f4980 ("ext3: Support
> for vfsv1 quota format") which has an obvious patch artifact (a line
> begins with '+') in a !CONFIG_QUOTA section.
  Ah, that's an artifact of my manual merge with other patches I have in my
tree.

> Please at least build test this stuff!
  I've tested it but with CONFIG_QUOTA enabled so this bug was hidden.
Sorry for the breakage.

									Honza
