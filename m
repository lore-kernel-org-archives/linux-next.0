From: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
Subject: Re: kernel panic on next-20160225
Date: Fri, 26 Feb 2016 17:05:06 +0900
Message-ID: <20160226080506.GB509@swordfish>
References: <56CFF19E.4010003@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <56CFF19E.4010003@oracle.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Junxiao Bi <junxiao.bi@oracle.com>
Cc: linux-next@vger.kernel.org, "ocfs2-devel@oss.oracle.com" <ocfs2-devel@oss.oracle.com>, Devel FS Linux <linux-fsdevel@vger.kernel.org>, Linux Kernel mailing list <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

On (02/26/16 14:33), Junxiao Bi wrote:
> Hi,
> 
> The following panic is triggered when run ocfs2 xattr test on
> linux-next-20160225. Did anybody ever see this?
> 

perhaps "fs: NULL deref in atime_needs_update"
http://marc.info/?i=CACT4Y+ae=DQjrTtwSqm1PJ9rsnRAvKiBkRjBqaQH6f6W1dOh2Q@mail.gmail.com

	-ss
