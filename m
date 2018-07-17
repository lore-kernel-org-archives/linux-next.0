From: Mimi Zohar <zohar@linux.ibm.com>
Subject: Re: linux-next: build failure after merge of the integrity tree
Date: Tue, 17 Jul 2018 09:18:06 -0400
Message-ID: <1531833486.3380.18.camel@linux.ibm.com>
References: <20180717144038.50394022@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180717144038.50394022@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>, Mimi Zohar <zohar@linux.vnet.ibm.com>, Dmitry Kasatkin <dmitry.kasatkin@gmail.com>
Cc: Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, James Morris <jmorris@namei.org>
List-Id: linux-next.vger.kernel.org

On Tue, 2018-07-17 at 14:40 +1000, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the integrity tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> security/integrity/ima/ima_main.c:549:5: error: redefinition of 'ima_load_data'
>  int ima_load_data(enum kernel_load_data_id id)
>      ^~~~~~~~~~~~~
> security/integrity/ima/ima_main.c:506:5: note: previous definition of 'ima_load_data' was here
>  int ima_load_data(enum kernel_load_data_id id)
>      ^~~~~~~~~~~~~
> 
> Caused by commit
> 
>   4995c7ac4490 ("ima: based on policy require signed kexec kernel images")
> 
> interacting with commit
> 
>   16c267aac86b ("ima: based on policy require signed kexec kernel images")
> 
> from the sceurity tree.
> 
> Basically the same set of patches are in the security tree and the
> integrity tree as different commits.  The merge managed to add this
> function twice.  I have added a patche to remove one copy of the function.
> 
> Please clean up the integrity tree relative to the security tree.

Done
