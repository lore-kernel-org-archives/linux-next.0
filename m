From: Paul Moore <paul@paul-moore.com>
Subject: Re: linux-next: manual merge of the audit tree with Linus' tree
Date: Tue, 20 Jan 2015 10:45:24 -0500
Message-ID: <CAHC9VhSmmK_UKr_ssByKKhwED+nSZ_6XjE1TtFTExg_dSN2Uag@mail.gmail.com>
References: <20150120150419.46c6d430@canb.auug.org.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20150120150419.46c6d430@canb.auug.org.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org, Richard Guy Briggs <rgb@redhat.com>
List-Id: linux-next.vger.kernel.org

On Mon, Jan 19, 2015 at 11:04 PM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi Paul,
>
> Today's linux-next merge of the audit tree got a conflict in
> include/linux/audit.h between commit 041d7b98ffe5 ("audit: restore
> AUDIT_LOGINUID unset ABI") from Linus' tree and commit e80da768eae4
> ("audit: remove vestiges of vers_ops") from the audit tree.

I suspect rebasing the audit next branch will resolve this issue as well.

-- 
paul moore
www.paul-moore.com
