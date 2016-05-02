From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: Tree for May 2   [WARNING: at fs/dcache.c]
Date: Mon, 2 May 2016 22:35:29 +1000
Message-ID: <20160502223529.5d1ffb78@canb.auug.org.au>
References: <20160502184018.502e9e7c@canb.auug.org.au>
	<20160502101524.GA417@swordfish>
	<20160502103352.x4thudsnc3jhexzo@mguzik>
	<20160502220745.44c4bd91@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-next-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:50139 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753114AbcEBMfc (ORCPT <rfc822;linux-next@vger.kernel.org>);
	Mon, 2 May 2016 08:35:32 -0400
In-Reply-To: <20160502220745.44c4bd91@canb.auug.org.au>
Sender: linux-next-owner@vger.kernel.org
List-ID: <linux-next.vger.kernel.org>
To: Mateusz Guzik <mguzik@redhat.com>
Cc: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>, linux-fsdevel@vger.kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Sergey Senozhatsky <sergey.senozhatsky@gmail.com>, Theodore Ts'o <tytso@mit.edu>, Miklos Szeredi <mszeredi@redhat.com>

Hi all,

On Mon, 2 May 2016 22:07:45 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> This comes from a bad automatic merge resolution between commit
> 
>   d101a125954e ("fs: add file_dentry()")
> 
> from Linus' tree (introduced before v4.5-rc3) and commit
                                      ^^^^^^^^
Clearly I typoed v4.6-rc3

-- 
Cheers,
Stephen Rothwell
