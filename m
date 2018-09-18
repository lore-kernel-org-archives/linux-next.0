From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Subject: Re: linux-next: Tree for Sep 18 (kernel/bpf/syscall)
Date: Tue, 18 Sep 2018 12:28:04 -0400
Message-ID: <CAF=yD-Kv7ig9UEo8Ci3eZOV=spa9cbGA5Mfa5Too8TgUzVA3fA@mail.gmail.com>
References: <20180918151235.4284275f@canb.auug.org.au> <0dc91212-54e8-d2f0-a4e3-30a468c20b8d@infradead.org>
 <a1129d67-97e3-8f10-c938-0de72fee9377@iogearbox.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <a1129d67-97e3-8f10-c938-0de72fee9377@iogearbox.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Daniel Borkmann <daniel@iogearbox.net>
Cc: rdunlap@infradead.org, Stephen Rothwell <sfr@canb.auug.org.au>, Linux-Next Mailing List <linux-next@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Network Development <netdev@vger.kernel.org>, Alexei Starovoitov <ast@kernel.org>, Petar Penkov <ppenkov@google.com>, Willem de Bruijn <willemb@google.com>
List-Id: linux-next.vger.kernel.org

On Tue, Sep 18, 2018 at 11:44 AM Daniel Borkmann <daniel@iogearbox.net> wrote:
>
> [ Cc Petar and Willem ]
>
> On 09/18/2018 05:37 PM, Randy Dunlap wrote:
> > On 9/17/18 10:12 PM, Stephen Rothwell wrote:
> >> Hi all,
> >>
> >> Changes since 20180913:
> >
> > on i386 or x86_64: (in 6 of 20 randconfigs)
> >
> > kernel/bpf/syscall.o: In function `__x64_sys_bpf':
> > syscall.c:(.text+0x3278): undefined reference to `skb_flow_dissector_bpf_prog_attach'
> > syscall.c:(.text+0x3310): undefined reference to `skb_flow_dissector_bpf_prog_detach'
> > kernel/bpf/syscall.o:(.rodata+0x3f0): undefined reference to `flow_dissector_prog_ops'
> > kernel/bpf/verifier.o:(.rodata+0x250): undefined reference to `flow_dissector_verifier_ops'
> >
> > Full randconfig file is attached.
>
> Looks like we need a wrapper for these, config had:
>
> # CONFIG_NET is not set

Thanks for forwarding the report.

For the functions, I think we can use a similar static inline stub as
used e.g., for bpf_map_offload_map_alloc.

The _ops references are from a macro that includes linux/bpf_types.h,
so indeed a CONFIG looks needed.

I need to look it over before I send out, but tentative patch:

diff --git a/include/linux/bpf_types.h b/include/linux/bpf_types.h
index 22083712dd18..f57fa5a6be8f 100644
--- a/include/linux/bpf_types.h
+++ b/include/linux/bpf_types.h
@@ -32,7 +32,9 @@ BPF_PROG_TYPE(BPF_PROG_TYPE_LIRC_MODE2, lirc_mode2)
 #ifdef CONFIG_INET
 BPF_PROG_TYPE(BPF_PROG_TYPE_SK_REUSEPORT, sk_reuseport)
 #endif
+#ifdef CONFIG_NET
 BPF_PROG_TYPE(BPF_PROG_TYPE_FLOW_DISSECTOR, flow_dissector)
+#endif

 BPF_MAP_TYPE(BPF_MAP_TYPE_ARRAY, array_map_ops)
 BPF_MAP_TYPE(BPF_MAP_TYPE_PERCPU_ARRAY, percpu_array_map_ops)
diff --git a/include/linux/skbuff.h b/include/linux/skbuff.h
index ce0e863f02a2..d26a21f10cec 100644
--- a/include/linux/skbuff.h
+++ b/include/linux/skbuff.h
@@ -1194,10 +1194,23 @@ void skb_flow_dissector_init(struct
flow_dissector *flow_dissector,
                             const struct flow_dissector_key *key,
                             unsigned int key_count);

+#if defined(CONFIG_NET) && defined(CONFIG_BPF_SYSCALL)
 int skb_flow_dissector_bpf_prog_attach(const union bpf_attr *attr,
                                       struct bpf_prog *prog);

 int skb_flow_dissector_bpf_prog_detach(const union bpf_attr *attr);
+#else
+static inline int skb_flow_dissector_bpf_prog_attach(const union
bpf_attr *attr,
+                                                    struct bpf_prog *prog)
+{
+       return -EOPNOTSUPP;
+}
+
+static inline int skb_flow_dissector_bpf_prog_detach(const union
bpf_attr *attr)
+{
+       return -EOPNOTSUPP;
+}
+#endif
