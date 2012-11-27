From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: linux-next: Tree for Nov 27 (file notify)
Date: Tue, 27 Nov 2012 08:43:43 -0800
Message-ID: <50B4EDBF.8070304@infradead.org>
References: <20121127172548.cd502ebfb903face1dc98554@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20121127172548.cd502ebfb903face1dc98554@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, Eric Paris <eparis@parisplace.org>
List-Id: linux-next.vger.kernel.org

On 11/26/2012 10:25 PM, Stephen Rothwell wrote:

> Hi all,
> 
> Changes since 20121126:
> 


when CONFIG_PROC_FS is not enabled (also seen in mmotm):

fs/notify/fanotify/fanotify_user.c:436:17: error: 'fanotify_show_fdinfo' undeclared here (not in a function)
fs/notify/inotify/inotify_user.c:333:17: error: 'inotify_show_fdinfo' undeclared here (not in a function)



-- 
~Randy
