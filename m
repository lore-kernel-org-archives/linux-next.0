From: Randy Dunlap <rdunlap@xenotime.net>
Subject: Re: mmotm 2011-08-02-16-19 uploaded (fault-inject.h)
Date: Wed, 3 Aug 2011 09:37:45 -0700
Message-ID: <20110803093745.0fcb7b76.rdunlap@xenotime.net>
References: <201108022357.p72NvsZM022462@imap1.linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-fsdevel-owner@vger.kernel.org>
In-Reply-To: <201108022357.p72NvsZM022462@imap1.linux-foundation.org>
Sender: linux-fsdevel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: akpm@linux-foundation.org, linux-mm@kvack.org, linux-fsdevel@vger.kernel.org, linux-next@vger.kernel.org
List-Id: linux-next.vger.kernel.org

On Tue, 02 Aug 2011 16:19:30 -0700 akpm@linux-foundation.org wrote:

> The mm-of-the-moment snapshot 2011-08-02-16-19 has been uploaded to
> 
>    http://userweb.kernel.org/~akpm/mmotm/
> 
> and will soon be available at
>    git://zen-kernel.org/kernel/mmotm.git
> or
>    git://git.cmpxchg.org/linux-mmotm.git
> 
> It contains the following patches against 3.0:

> fault-injection-add-ability-to-export-fault_attr-in-arbitrary-directory.patch

Please drop the ';' at the end of the second line below:

+static inline struct dentry *fault_create_debugfs_attr(const char *name,
+			struct dentry *parent, struct fault_attr *attr);
 {
+	return ERR_PTR(-ENODEV);
 }

It causes lots of build errors.

---
~Randy
*** Remember to use Documentation/SubmitChecklist when testing your code ***
