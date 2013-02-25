From: Al Viro <viro@ZenIV.linux.org.uk>
Subject: Re: linux-next: Tree for Feb 23 [ fs/dcache.c: Root dentry has weird
 name <SYSV00000000> ]
Date: Mon, 25 Feb 2013 13:54:36 +0000
Message-ID: <20130225135436.GA4503@ZenIV.linux.org.uk>
References: <CA+icZUVE-KzZ_ZnhjK+WzaC9KWuwuOK0TAJbNcn+Vn=HC=snhQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CA+icZUVE-KzZ_ZnhjK+WzaC9KWuwuOK0TAJbNcn+Vn=HC=snhQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sedat Dilek <sedat.dilek@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, linux-fsdevel <linux-fsdevel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On Mon, Feb 25, 2013 at 02:22:42PM +0100, Sedat Dilek wrote:

> [  120.310366] Root dentry has weird name <SYSV00000000>

Umm...  Almost certainly a result of switching to shmem_file_setup() to
d_alloc_pseudo(); I'll fix it (give the suckers ->d_op of their own).
For now, just ignore the warning - it's harmless.  Or revert commit
7dbc68fcb0cdce27737dba9ee252f26d39d75fb6 and see if the rest of your
problems persist; I would be very surprised if anything other than this
warning had been caused by that commit.
