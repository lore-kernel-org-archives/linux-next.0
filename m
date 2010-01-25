From: =?utf-8?Q?Am=C3=A9rico?= Wang <xiyou.wangcong@gmail.com>
Subject: Re: About ACL for IPC Object
Date: Tue, 26 Jan 2010 00:26:47 +0800
Message-ID: <20100125162647.GC3749@hack>
References: <6fb445941001200112o2934f805l4eb4f78000e9527e@mail.gmail.com> <6fb445941001200120m3aa5e944j54a6f645ce82d76f@mail.gmail.com> <4B57C3C3.9010606@schaufler-ca.com> <20100121090510.GA908@infradead.org> <6fb445941001220115y6b99f7b4g306ea23d3202969@mail.gmail.com> <2375c9f91001220202m724e2ee2p2213b81a043ebd33@mail.gmail.com> <6fb445941001250721p73795fe2i9196bd3c77dd0fce@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-security-module-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <6fb445941001250721p73795fe2i9196bd3c77dd0fce@mail.gmail.com>
Sender: linux-security-module-owner@vger.kernel.org
To: zhou peng <ailvpeng25@gmail.com>
Cc: =?utf-8?Q?Am=C3=A9rico?= Wang <xiyou.wangcong@gmail.com>, Christoph Hellwig <hch@infradead.org>, Casey Schaufler <casey@schaufler-ca.com>, sds@tycho.nsa.gov, jra@samba.org, linux-security-module@vger.kernel.org, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, linux-fsdevel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Mon, Jan 25, 2010 at 11:21:44PM +0800, zhou peng wrote:
>I have tested posix sem,posix shm and posix msg queue for ACL on
>fedora 12 with kernel 2.6.32.
>
>Posix sem and posix shm using tmpfs monted by default support ACL well .
>Posix msg queue use mqueue fs mounted by manual but it seem not
>surpoort ACL well. It failed for setting named ACL item:
>{
> $ mkdir /dev/mqueue
> $ mount -o rw, acl -t mqueue none /dev/mqueue
> $cd /dev/mqueue
> "/mq" msg queue object created and used by processes properly
>
> $getfacl mq
>   #file: mq
>   #owner:root
>   #group:root
>   user:rw-
>   group::---
>   other::---
>
> $setfacl -m u:testuser:rw mq                                   /* failed here*/
> $setfacl: mq :Operation not supported
> but mqueue fs works well for setting owner user and owner group items.
>}
>
>I am not sure whether mqueue don't support acl or I make mistake.
>

A quick look at the source code shows mqueue doesn't support ACL.


-- 
Live like a child, think like the god.
 
