From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Subject: Re: linux-next: build warnings from Linus' tree
Date: Mon, 20 Aug 2018 19:47:14 +0200
Message-ID: <CANiq72nHvUW1sF2RiWTuLE4h5GbSaSH8Xm+gg0aucKSqrqpB2A@mail.gmail.com>
References: <20180820081323.23a47af3@canb.auug.org.au> <20180820000218.GE19200@thunk.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180820000218.GE19200@thunk.org>
Sender: linux-kernel-owner@vger.kernel.org
To: "Theodore Y. Ts'o" <tytso@mit.edu>, Stephen Rothwell <sfr@canb.auug.org.au>, Linus Torvalds <torvalds@linux-foundation.org>, Linux-Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-next.vger.kernel.org

Hi Ted,

On Mon, Aug 20, 2018 at 2:02 AM, Theodore Y. Ts'o <tytso@mit.edu> wrote:
> P.S.  It's really, really too bad there isn't a simpler way to shut up
> gcc.  You need the #ifdef __GNUC_PREREQ nonsense because otherwise
> older versions of gcc that don't understand the particular warning
> you're trying to suppress will complain loudly.  (Ask me how I
> know....)

Please check out the __nonstring patch I sent (the one Linus is
referring to, I guess) and see if you think it would be a good
solution for your case:

  https://lore.kernel.org/lkml/20180814193813.GA5473@gmail.com/

I just tried the patch below with 8.2 [*] and those two warnings in
fs/ext4 go away as expected.

I think marking those fixed-width fields is a good idea anyway (i.e.
makes it clear that they are not meant to be null-terminated), but I
would like to hear opinions on the matter.

Cheers,
Miguel

[*]

diff --git a/fs/ext4/ext4.h b/fs/ext4/ext4.h
index 0f0edd1cd0cd..3eef4b286895 100644
--- a/fs/ext4/ext4.h
+++ b/fs/ext4/ext4.h
@@ -1277,13 +1277,13 @@ struct ext4_super_block {
        __le32  s_first_error_time;     /* first time an error happened */
        __le32  s_first_error_ino;      /* inode involved in first error */
        __le64  s_first_error_block;    /* block involved of first error */
-       __u8    s_first_error_func[32]; /* function where the error happened */
+       __u8    s_first_error_func[32] __nonstring;     /* function
where the error happened */
        __le32  s_first_error_line;     /* line number where error happened */
        __le32  s_last_error_time;      /* most recent time of an error */
        __le32  s_last_error_ino;       /* inode involved in last error */
        __le32  s_last_error_line;      /* line number where error happened */
        __le64  s_last_error_block;     /* block involved of last error */
-       __u8    s_last_error_func[32];  /* function where the error happened */
+       __u8    s_last_error_func[32] __nonstring;      /* function
where the error happened */
 #define EXT4_S_ERR_END offsetof(struct ext4_super_block, s_mount_opts)
        __u8    s_mount_opts[64];
        __le32  s_usr_quota_inum;       /* inode for tracking user quota */
