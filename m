From: Nick Piggin <npiggin@kernel.dk>
Subject: Re: [patch] cgroup fs: avoid switching ->d_op on
	live dentry
Date: Tue, 21 Dec 2010 19:55:38 +1100
Message-ID: <20101221085538.GA9133@amd>
References: <AANLkTinod+7fDMwh8_XsQe4mnF1P6WoRWyh36yJXM4LO@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <systemd-devel-bounces+gcssd-systemd-devel=m.gmane.org@lists.freedesktop.org>
Content-Disposition: inline
In-Reply-To: <AANLkTinod+7fDMwh8_XsQe4mnF1P6WoRWyh36yJXM4LO@mail.gmail.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/systemd-devel>,
	<mailto:systemd-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/systemd-devel>
List-Post: <mailto:systemd-devel@lists.freedesktop.org>
List-Help: <mailto:systemd-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/systemd-devel>,
	<mailto:systemd-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: systemd-devel-bounces+gcssd-systemd-devel=m.gmane.org@lists.freedesktop.org
Errors-To: systemd-devel-bounces+gcssd-systemd-devel=m.gmane.org@lists.freedesktop.org
To: sedat.dilek@gmail.com
Cc: linux-fsdevel@vger.kernel.org, linux-next@vger.kernel.org, systemd-devel@lists.freedesktop.org, Nick Piggin <npiggin@kernel.dk>, eparis@redhat.com
List-Id: linux-next.vger.kernel.org

On Tue, Dec 21, 2010 at 09:44:40AM +0100, Sedat Dilek wrote:
> Against linux-next (next-20101210) it should look like:

Yep, I'll rebase my tree with the fix shortly.

> 
> $ diff -Naur cgroup-fix/cgroup-fs-avoid-switching-d_op-on-live-dentry.patch
> cgroup-fix/cgroup-fs-avoid-switching-d_op-on-live-dentry-v2.patch
> --- cgroup-fix/cgroup-fs-avoid-switching-d_op-on-live-dentry.patch
>  2010-12-21 09:31:38.649601964 +0100
> +++ cgroup-fix/cgroup-fs-avoid-switching-d_op-on-live-dentry-v2.patch
>  2010-12-21 09:40:21.151033232 +0100
> @@ -83,7 +83,7 @@
>                 inode->i_size = 0;
>                 inode->i_fop = &cgroup_file_operations;
>         }
> --      dentry->d_op = &cgroup_dops;
> +-      d_set_d_op(dentry, &cgroup_dops);
>         d_instantiate(dentry, inode);
>         dget(dentry);   /* Extra count - pin the dentry in core */
>         return 0;
> 
> - Sedat -
