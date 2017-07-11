From: David Howells <dhowells@redhat.com>
Subject: Re: linux-next: build failure after merge of the vfs tree
Date: Tue, 11 Jul 2017 10:21:09 +0100
Message-ID: <18339.1499764869@warthog.procyon.org.uk>
References: <20170711105532.045d0148@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170711105532.045d0148@canb.auug.org.au>
Content-ID: <18338.1499764869.1@warthog.procyon.org.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: dhowells@redhat.com, Al Viro <viro@ZenIV.linux.org.uk>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> -	if (inode->i_mode & S_IALLUGO != 0775)
> +	if ((inode->i_mode & S_IALLUGO) != 0775)

Acked-by: David Howells <dhowells@redhat.com>
