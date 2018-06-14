From: David Howells <dhowells@redhat.com>
Subject: Re: linux-next: Tree for Jun 4 (fs/afs/)
Date: Thu, 14 Jun 2018 16:08:08 +0100
Message-ID: <16431.1528988888@warthog.procyon.org.uk>
References: <7e4a317a-d57e-1499-dc1e-2eba35610632@infradead.org> <20180604215911.75399f6e@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <7e4a317a-d57e-1499-dc1e-2eba35610632@infradead.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Randy Dunlap <rdunlap@infradead.org>
Cc: dhowells@redhat.com, viro@zeniv.linux.org.uk, Stephen Rothwell <sfr@canb.auug.org.au>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-afs@lists.infradead.org, Linux FS Devel <linux-fsdevel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

Randy Dunlap <rdunlap@infradead.org> wrote:

> ../fs/afs/proc.c:604:2: error: implicit declaration of function ‘proc_create_net_data_write’ [-Werror=implicit-function-declaration]

I've given Al a patch for this.

David
