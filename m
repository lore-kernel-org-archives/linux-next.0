From: Casey Schaufler <casey@schaufler-ca.com>
Subject: Re: About ACL for IPC Object
Date: Wed, 20 Jan 2010 19:02:27 -0800
Message-ID: <4B57C3C3.9010606@schaufler-ca.com>
References: <6fb445941001200112o2934f805l4eb4f78000e9527e@mail.gmail.com> <6fb445941001200120m3aa5e944j54a6f645ce82d76f@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-security-module-owner@vger.kernel.org>
In-Reply-To: <6fb445941001200120m3aa5e944j54a6f645ce82d76f@mail.gmail.com>
Sender: linux-security-module-owner@vger.kernel.org
To: zhou peng <ailvpeng25@gmail.com>
Cc: linux-security-module@vger.kernel.org, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, linux-fsdevel@vger.kernel.org, Casey Schaufler <casey@schaufler-ca.com>
List-Id: linux-next.vger.kernel.org

zhou peng wrote:
> Hi all,
>
> There are ACL in file system, but why there are no ACL implementation
> in IPC object, eg. shm, message queue, FIFO?
>   

Most people haven't noticed that IPC objects are even there, much less
that they have mode bits and not ACLs. Even when we were doing security
evaluations on Unix boxes in the 1990's they were considered insufficiently
interesting to justify the additional work to do ACLs.

If you really want ACLs on IPC objects it would make a dandy little
project for a summer. I would be happy to review patches.

> Is there any fine grained granting in ipc object just like in file object?
>   

As Stephen Smalley points out, you can do it with SELinux, although
that it rather like driving a thumbtack with a bulldozer.

> Thanks,
> Best
>
> --
> zhoupeng
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/
>
>
>   

