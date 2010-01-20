From: Jeremy Allison <jra@samba.org>
Subject: Re: About ACL for IPC Object
Date: Wed, 20 Jan 2010 13:50:48 -0800
Message-ID: <20100120215048.GB4141@jeremy-laptop>
References: <6fb445941001200112o2934f805l4eb4f78000e9527e@mail.gmail.com>
 <6fb445941001200120m3aa5e944j54a6f645ce82d76f@mail.gmail.com>
Reply-To: Jeremy Allison <jra@samba.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-security-module-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <6fb445941001200120m3aa5e944j54a6f645ce82d76f@mail.gmail.com>
Sender: linux-security-module-owner@vger.kernel.org
To: zhou peng <ailvpeng25@gmail.com>
Cc: linux-security-module@vger.kernel.org, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, linux-fsdevel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Wed, Jan 20, 2010 at 05:20:00PM +0800, zhou peng wrote:
> Hi all,
> 
> There are ACL in file system, but why there are no ACL implementation
> in IPC object, eg. shm, message queue, FIFO?
> Is there any fine grained granting in ipc object just like in file object?

Not implemented yet, we can add this if you need it
(but probably will be a 3.6.0 feature).

Jeremy.
