From: zhou peng <ailvpeng25@gmail.com>
Subject: About ACL for IPC Object
Date: Wed, 20 Jan 2010 17:20:00 +0800
Message-ID: <6fb445941001200120m3aa5e944j54a6f645ce82d76f@mail.gmail.com>
References: <6fb445941001200112o2934f805l4eb4f78000e9527e@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-security-module-owner@vger.kernel.org>
In-Reply-To: <6fb445941001200112o2934f805l4eb4f78000e9527e@mail.gmail.com>
Sender: linux-security-module-owner@vger.kernel.org
To: linux-security-module@vger.kernel.org, linux-next@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, linux-fsdevel@vger.kernel.org
List-Id: linux-next.vger.kernel.org

Hi all,

There are ACL in file system, but why there are no ACL implementation
in IPC object, eg. shm, message queue, FIFO?
Is there any fine grained granting in ipc object just like in file object?

Thanks,
Best

--
zhoupeng
